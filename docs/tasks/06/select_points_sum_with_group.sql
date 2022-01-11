SELECT year_game, sum(points)
FROM data.statistic
GROUP BY year_game
ORDER BY year_game