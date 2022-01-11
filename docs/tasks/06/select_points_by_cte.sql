WITH sum_with_grouping_and_sorting
         AS (
        SELECT year_game, sum(points)
        FROM data.statistic
        GROUP BY year_game
        ORDER BY year_game
    )
SELECT *
FROM sum_with_grouping_and_sorting