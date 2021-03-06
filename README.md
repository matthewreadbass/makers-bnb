# MakersBNB

## Setting up Database

Connect to psql and create the makersbnb and makersbnb_test databases

```
psql
CREATE DATABASE makersbnb;
CREATE DATABASE makersbnb_test;
```

Exit it out of the psql REPL and back into your shell

```
\q
```

Run the SQL scripts to create tables for both databases

```
Create users table for main and test database
psql -d makersbnb -f db/migrations/01_create_users_table.sql
psql -d makersbnb_test -f db/migrations/01_create_users_table.sql

Create spaces table for main and test database
psql -d makersbnb -f db/migrations/02_create_spaces_table.sql
psql -d makersbnb_test -f db/migrations/02_create_spaces_table.sql
```

## User stories

```
[x] As a host,
So that I can see other spaces,
I would like to sign up to makersbnb
Objects: User
Methods: .create(name, email, password)
```

```
[x] As a host,
So that I can rent out my property,
I would like to list my space on makersbnb
Objects: Space
Methods: .create()
```

```
[ x ] As a host,
So that I can rent out multiple properties,
I would like to list more than one space.
Objects: Space
Methods: .create()
Notes: properties can be listed in database and attached to a user id of the owner
```

```
[x] As a host,
So that guests can see a specific space,
I would like to provide a name for my space.
Objects: Space
Methods: .create(title)
Notes: provide an argument for the title (like on a form)
```

```
[x] As a host,
So that guests can get more information about my property,
I would like to provide a short description of the space.
Objects: Space
Methods: .create(description) // nice to have: .create_description
Notes: provide an argument for the description (like on a form)
```

```
[x] As a host,
So that guests are aware of the current pricing of my property,
I would like to add a price per night for my space.
Objects: Space
Methods: .create(price_per_night)
Notes: host will submit the PPN on a form, with that value being passed as an argument
```

```
[ ] As a host,
So that my property isn’t double booked,
I would like to specify a range of available rental dates.
Objects: Space
Methods: .create(available_from, available_to)
Notes: have a date picker, in which the values will be passed in as arguments
```

```
[x] As a guest,
So that I can rent a space,
I would like to sign up to makersbnb.
Objects: User
Fields: Name, Email, Password
Methods: .create(name, email, password)
Notes: Same as for host
```

```
[ ] As a guest,
So that I can rent a space,
I would like to request an available space.
Objects: User, Space
Methods: Space.request(date_from, date_to, user_id)
Notes: the user will click a ‘request’ button, and that will trigger a method that assigns a requested? column to true
```

```
[ ] As a host,
So that I can rent out my property,
I would like to approve a rental request made by the guest.
Objects: User, Space
Methods: Space.accept(user_id)
Notes: host will accept the request made from a user, and the method will accept it only to the person provided in the argument
```

```
[ ] As a host/guest,
To avoid double bookings and disappointment,
I would like makersbnb to only advertise available properties.
Objects: Space
Methods: .available?
Notes: if the Space.available? == True, then display it on home page, otherwise assume it is taken and not display
```

```
[ ] As a host,
So that I can rent out my property,
I would like my space to remain available until a request is approved.
Objects: Space
Notes: involves 2 methods above this one, where the request will remain the same until the host accepts. the property will still be shown on the home page regardless until accepted
```
## Diagrams in progress 

**Final features may change** 

Class Diagram for starting project: 

![](images/image_123.png)

MVC example for listing spaces:

![](images/image_1234.png)
