-- anomaly_detection.sql (Advanced with partition window)

CREATE VIEW traffic_anomalies AS
SELECT 
    segment_id,
    segment_name,
    recorded_at,
    average_speed_kmph,
    congestion_level,
    delay_percent,
    ROW_NUMBER() OVER (PARTITION BY segment_id ORDER BY recorded_at DESC) AS latest_rank,
    CASE 
        WHEN delay_percent > 40 THEN 'High Delay'
        WHEN delay_percent > 20 THEN 'Moderate Delay'
        ELSE 'Normal'
    END AS delay_status
FROM traffic_segments;
