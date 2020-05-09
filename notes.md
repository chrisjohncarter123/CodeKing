

user has many pushes

pushes belong to a repo
pushes belong to a user

repos has many pushes

users has many repos through pushes

repos would have many users through pushes.



rails g resource Repo name:string —-no-test-framework
rails g resource Push repo_id:integer user_id:integer —-no-test-framework