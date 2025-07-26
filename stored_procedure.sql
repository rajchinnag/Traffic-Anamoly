-- stored_procedure.sql (Advanced feature)

-- Refresh anomaly log
CREATE OR REPLACE FUNCTION log_anomaly_refresh()
RETURNS VOID AS $$
BEGIN
    INSERT INTO anomaly_log (affected_segments)
    SELECT COUNT(*) FROM traffic_segments WHERE delay_percent > 40;
END;
$$ LANGUAGE plpgsql;

-- To run:
-- SELECT log_anomaly_refresh();
