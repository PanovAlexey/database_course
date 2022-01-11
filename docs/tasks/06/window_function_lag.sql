SELECT LAG(SUM(points)) OVER (ORDER BY year_game DESC) AS lag_points,
        LAG(year_game) OVER (ORDER BY year_game DESC)   AS lag_year
FROM data.statistic
GROUP BY year_game
ORDER BY year_game;
