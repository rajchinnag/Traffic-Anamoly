-- schema.sql (Updated with Advanced Features)

-- Enable PostGIS if using geospatial features (optional)
-- CREATE EXTENSION postgis;

-- Table for road segments and traffic data
CREATE TABLE traffic_segments (
    segment_id SERIAL PRIMARY KEY,
    segment_name TEXT,
    recorded_at TIMESTAMP,
    average_speed_kmph NUMERIC,
    congestion_level TEXT, -- Clear, Moderate, Heavy
    delay_percent NUMERIC,
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION
);

-- Table for route mapping
CREATE TABLE route_segments (
    route_id INT,
    segment_id INT,
    PRIMARY KEY (route_id, segment_id)
);

-- Table to track last refresh or anomaly run
CREATE TABLE anomaly_log (
    run_id SERIAL PRIMARY KEY,
    executed_at TIMESTAMP DEFAULT NOW(),
    affected_segments INT
);
