/*Get user by username */
select * from user where username = ?;

/*Get all resources and user_resources for given username */
select *
    from user u
        join user_resource ur on ur.user_id = u.id
        join resource r on r.id = ur.resource_id
where u.username = 'dpalmer0';

/*nicer view of the above*/
select u.first_name, u.last_name, u.email, ur.notes, ur.rating, r.name AS resource_name, r.id AS resource_id
    from user u
        join user_resource ur on ur.user_id = u.id
        join resource r on r.id = ur.resource_id
where u.username = 'dpalmer0';

/*View resources not owned by user id*/
select u.id, u.username, r.name AS resource_name, r.id AS resource_id
    from user u
        join user_resource ur on ur.user_id = u.id
        join resource r on r.id = ur.resource_id
where u.id != 1;

select r.id, r.name AS resourceName, u.id, u.username
    from resource r
    join user_resource ur on r.id = ur.resource_id
    join user u on u.id = ur.user_id
where u.id = 1;
        
