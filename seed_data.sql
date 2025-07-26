-- seed_data.sql (Updated)

-- Insert realistic seed traffic data with coordinates
INSERT INTO traffic_segments (segment_name, recorded_at, average_speed_kmph, congestion_level, delay_percent, latitude, longitude)
SELECT 
    'Segment ' || s::TEXT,
    gs,
    ROUND(30 + random() * 50, 2),
    CASE WHEN random() < 0.6 THEN 'Clear' WHEN random() < 0.85 THEN 'Moderate' ELSE 'Heavy' END,
    ROUND(random() * 100, 2),
    17.0 + random(), -- latitude
    78.0 + random() -- longitude
FROM 
    generate_series(1, 50) s,
    generate_series(NOW() - interval '1 day', NOW(), interval '1 hour') gs;

-- Map segments to 4 predefined routes
INSERT INTO route_segments (route_id, segment_id)
SELECT route_id, segment_id FROM (
    SELECT 
        (segment_id % 4) + 1 AS route_id, 
        segment_id
    FROM traffic_segments
) AS route_map;
