-- best_route_view.sql (Advanced ranking)

CREATE VIEW best_route AS
SELECT * FROM (
    SELECT 
        rs.route_id,
        heavy_segments,
        high_delay_segments,
        avg_speed,
        RANK() OVER (ORDER BY high_delay_segments ASC, heavy_segments ASC, avg_speed DESC) AS route_rank
    FROM route_scores rs
) ranked
WHERE route_rank = 1;
