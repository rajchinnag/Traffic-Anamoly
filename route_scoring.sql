-- route_scoring.sql (Advanced logic)

CREATE VIEW route_scores AS
SELECT 
    rs.route_id,
    COUNT(CASE WHEN ts.congestion_level = 'Heavy' THEN 1 END) AS heavy_segments,
    COUNT(CASE WHEN ts.delay_percent > 40 THEN 1 END) AS high_delay_segments,
    AVG(ts.average_speed_kmph) AS avg_speed,
    MIN(ts.delay_percent) AS min_delay,
    MAX(ts.delay_percent) AS max_delay
FROM route_segments rs
JOIN traffic_segments ts ON rs.segment_id = ts.segment_id
GROUP BY rs.route_id
ORDER BY high_delay_segments, heavy_segments;
