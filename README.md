# MakersBNB

## User stories

```
As a host,
So that I can see other spaces,
I would like to sign up to makersbnb
Objects: User
Methods: .create(name, email, password)
```

```
As a host,
So that I can rent out my property,
I would like to list my space on makersbnb
Objects: Space
Methods: .create()
```

```
As a host,
So that I can rent out multiple properties,
I would like to list more than one space.
Objects: Space
Methods: .create()
Notes: properties can be listed in database and attached to a user id of the owner
```

```
As a host,
So that guests can see a specific space,
I would like to provide a name for my space.
Objects: Space
Methods: .create(title)
Notes: provide an argument for the title (like on a form)
```

```
As a host,
So that guests can get more information about my property,
I would like to provide a short description of the space.
Objects: Space
Methods: .create(description) // nice to have: .create_description
Notes: provide an argument for the description (like on a form)
```

```
As a host,
So that guests are aware of the current pricing of my property,
I would like to add a price per night for my space.
Objects: Space
Methods: .create(price_per_night)
Notes: host will submit the PPN on a form, with that value being passed as an argument
```

```
As a host,
So that my property isn’t double booked,
I would like to specify a range of available rental dates.
Objects: Space
Methods: .create(available_from, available_to)
Notes: have a date picker, in which the values will be passed in as arguments
```

```
As a guest,
So that I can rent a space,
I would like to sign up to makersbnb.
Objects: User
Fields: Name, Email, Password
Methods: .create(name, email, password)
Notes: Same as for host
```

```
As a guest,
So that I can rent a space,
I would like to request an available space.
Objects: User, Space
Methods: Space.request(date_from, date_to, user_id)
Notes: the user will click a ‘request’ button, and that will trigger a method that assigns a requested? column to true
```

```
As a host,
So that I can rent out my property,
I would like to approve a rental request made by the guest.
Objects: User, Space
Methods: Space.accept(user_id)
Notes: host will accept the request made from a user, and the method will accept it only to the person provided in the argument
```

```
As a host/guest,
To avoid double bookings and disappointment,
I would like makersbnb to only advertise available properties.
Objects: Space
Methods: .available?
Notes: if the Space.available? == True, then display it on home page, otherwise assume it is taken and not display
```

```
As a host,
So that I can rent out my property,
I would like my space to remain available until a request is approved.
Objects: Space
Notes: involves 2 methods above this one, where the request will remain the same until the host accepts. the property will still be shown on the home page regardless until accepted
```
