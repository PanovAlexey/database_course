select data.users.id, data.users.region_id, data.regions.name_ru, data.countries.common_name
from data.users
         left join data.regions on users.region_id = regions.id
         left join data.countries on users.country_id = countries.id
where
        users.active = false
