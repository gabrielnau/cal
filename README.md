# cal

## Notes

- user roles are not implemented (i.e. only a car owner can set an availability on his own car)
- date parameters should be checked before being used
- should handle overlapping of periods (even if that's also front end problem)
- if a user sets 20 days of availabilities, it will, in the worst case, need to 20 queries to know if 
the availability record already exist, and 20 more to create each one
- no handling of timezones
- User model is completely useless, I thought I would implement roles but it's out of scope

## Timing

1. 1 hour spent on translation of the exercice into specs
2. 40min spent on first try with ruby Set
3. 1 hour spent on setting up Rails 4
4. 1.8 hour on making specs pass, and especially on fighting against this bug : http://pivotallabs.com/reading-the-ruby-source/, and also and querying for a date range

## Run tests

- Poro : ```bundle exec rspec spec/resource_spec.rb```
- Rails app :
  1. run ```RAILS_ENV=test rake db:create db:migrate```
  2. ```bundle exec rspec```
