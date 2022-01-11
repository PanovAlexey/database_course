CREATE TABLE statistic
(
    player_name VARCHAR(100) NOT NULL,
    player_id   INT          NOT NULL,
    year_game   SMALLINT     NOT NULL CHECK (year_game > 0),
    points      DECIMAL(12, 2) CHECK (points >= 0),
    PRIMARY KEY (player_name, year_game)
);