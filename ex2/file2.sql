Create VIEW `userview`
AS SELECT
   concat_ws(' ',`u`.`firstname`,
   `u`.`lastname`) AS `username`,
   `c`.`name` AS `country`,
   `l`.`name` AS `language`
FROM (((`users` `u` 
join `country` `c` on((`c`.`id` = `u`.`country_id`))) 
left join `user_lang` `ul` on((`ul`.`user_id` = `u`.`id`))) 
left join `language` `l` on((`l`.`id` = `ul`.`language_id`))) 
order by concat_ws(' ',`u`.`firstname`,`u`.`lastname`);