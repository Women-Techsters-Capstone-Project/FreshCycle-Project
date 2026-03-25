#AI integration

#Importing the Libraries
import numpy as np
import pandas as pd
import os
import json
import argparse



#Configuration(Rules Setting)
min_lot_kg = 500
Auto_match_threshold = 0.80
Review_threshold = 0.60

#Spoilage and Shelf life logic(To make freshness decision)
def spoilage_band(Produce):
    if 'days_since_harvest' not in Produce.columns:
        raise ValueError('column not found')
    
    if 'medium_risk_day' not in Produce.columns:
        Produce['medium_risk_day'] = 5
        
    if 'high_risk_day' not in Produce.columns:
        Produce['high_risk_day'] = 8
        
    Produce['Spoilage_Band'] = np.where(Produce['days_since_harvest'] >=
                                        Produce['high_risk_day'], 'High',
                                        np.where(Produce['days_since_harvest'] >=
                                                 Produce['medium_risk_day'], 'Medium', 'Low'))
    return Produce


#Aggregation Status
def aggregation_status(Produce):
    if 'lot_id' in Produce.columns:
        Produce['aggregation_status'] = np.where(Produce['lot_id'].notna(),
                                                 'Aggregated', 'Not_Aggregated')
    else:
        Produce['aggregation_status'] = 'Not_Aggregated'
    return Produce

def create_lot_table(Produce):
    if 'lot_id' not in Produce.columns:
        return pd.DataFrame()
    
    keep =[c for c in ['lot_id','country','region','crop_type'
                       'total_quantity_kg','weighted_avg_ask_price_usd_per_kg',
                       'average_spoilage_risk_score','max_days_since_harvest',
                       'recommended_discount_pct','recommended_price_per_usd',
                       'priority']if c in Produce.columns]
    
    lots = Produce[Produce['lot_id'].notna()][keep].drop_duplicates()
    
    if 'total_quantity_kg' in lots.columns:
        lots = lots[lots['total_quantity_kg'] >= min_lot_kg]
        
    return lots

#Matching Logic(checks whether the buyers order has been matched)
def match_status(Produce):
    if 'decision' in Produce.columns:
        Produce['match_status'] = Produce['decision'].fillna('Not_Matched')
        return Produce
    
    if 'match_score' in Produce.columns:
        Produce['match_score'] = pd.to_numeric(Produce['match_score'], errors ='coerce')
        Produce['match_status'] = np.where(Produce['match_score'] >= Auto_match_threshold, 'Auto_Match',
                                           np.where(Produce['match_score'] >= Review_threshold, 'Review_Required', 
                                                    'Not_Matched'))
        return Produce
    
    Produce['match_status'] = 'Not_Matched'
    return Produce

#Exporting all tables created
def export_tables(Produce, lots, outdir):
    os.makedirs(outdir, exist_ok=True)
    
#ShelfLife Table
    crop_col = 'crop_type' if 'crop_type' in Produce.columns else 'produce'

    Shelflife_col = ('baseline_shelf_life_days' if 'baseline_shelf_life_days'
                 in Produce.columns else 'default_shelf_life_days')

    ShelfLife = (Produce[[crop_col, Shelflife_col, 'medium_risk_day', 'high_risk_day']].drop_duplicates().
             sort_values(crop_col).rename(columns={crop_col:'crop_type',
                                                   Shelflife_col: 'baseline_shelf_life_days'}))
    ShelfLife.to_csv(f'{outdir}/ Shelflife_threshold_recommendation.csv', index=False)
    
#Aggregated lots Table
    lots.to_csv(f'{outdir}/ aggregated_lots.csv', index=False)

#Buyer order Match
    if 'order_id' in Produce.columns:
        
        keep = [c for c in ['order_id','lot_id','match_score','decision','match_status',
                            'region_match','required_quantity_kg','target_price_usd_per_kg',
                            'min_quality_grade','max_days_since_harvest'] if c in Produce.columns]
        matches = Produce[Produce['order_id'].notna()][keep].drop_duplicates()
        
    else:
        matches = pd.DataFrame()
        
    matches.to_csv(f'{outdir}/order_lot_matches.csv', index=False)
    
#Validation report

    report ={'rows_total': int(len(Produce)),
             'aggregation_rate_pct': round(Produce['lot_id'].notna().mean()*100,2)
             if 'lot_id' in Produce.columns else 0,
             'match_rate_pct': round(Produce['order_id'].notna().mean() * 100,2) if 'order_id' in Produce.columns else 0,
             'spoilage_band_counts': Produce['Spoilage_Band'].value_counts().to_dict(),
             'match_status_counts': Produce['match_status'].value_counts().to_dict(),}
    
    with open(f'{outdir}/validation_report.json','w',encoding='utf-8') as f:
        json.dump(report,f,indent=2)
        
#saving the produce data set
    Produce.to_csv(f'{outdir}/fresh_AI.csv', index=False)  
    
#Main Pipeline
def run_pipeline(Produce_csv, outdir):
    Produce = pd.read_csv(Produce_csv) 
    
    Produce = spoilage_band(Produce)  
    Produce = aggregation_status(Produce)
    Produce = match_status(Produce)
    
    lots = create_lot_table(Produce)
    
    export_tables(Produce,lots,outdir)
    
    print('All AI integration features generated')
    
    
#Terminal Run
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True)
    parser.add_argument('--outdir', default='outputs')
    args = parser.parse_args()
    
    run_pipeline(args.input,args.outdir)
    

    
 
        