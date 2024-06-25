# Stepful take home assignment

A simple rails app for scheduling calls between coaches and students. As configured it expects to have a local postgres database with username and password stepful/stepful and a `seed.rb` file is provided to create some example users and calls.

Once the server is up and running a user can log in by entering the id of one of the seed users for testing. Users are represented by the `User` model which uses single table inheritance to represent two subtypes, `Coach` and `Student`. The `User` model validates the presence of a `name` and `phone` field in wither case. The other main component of the data model is the `Call` model. A call must have a `Coach` and may optionally have a `Student`. This optionality is used when a coach initially enters their availability, before a student has booked a call. Calls must also have a `start` datetime and may not overlap with the other calls belonging to the same coach however there is currently no validation to prevent a student booking overlapping calls with different coaches. The overlap validation assumes that calls are always 2 hours long.

A new user should be redirected to the [login](http://127.0.0.1:3000/login) page where the id of one of the test users can be entered to log in. Users 1, 3, and 5 are coaches, users 2 and 4 are students. Once logged in a user is redirected to the [scheduled](http://127.0.0.1:3000/scheduled) page where they can see any calls they have scheduled with a student. The [availability](http://127.0.0.1:3000/availability) page shows the times when the coach is available for a call that have not yet been claimed by a student and provides a [calls/new](http://127.0.0.1:3000/calls/new) link to add new availability. Existing availability can be updated or removed from the `/calls/:id` page e.g. [/calls/4](http://127.0.0.1:3000/calls/4). Calls where the `start` is in the past are shown on the [past calls](http://127.0.0.1:3000/past) page and in this case the `/calls/:id/edit` page prompts for the entry of a numeric `satisfaction` rating and text `notes`. Although the `satisfaction` rating is necessarily numeric no validation is currently provided to ensure that values is in the expected range 1-5. Calls are paginated via [kaminari](https://github.com/kaminari/kaminari) as can be seen when logged in as user 4 who has a large number of calls scheduled. Calls are ordered by the `start` attribute.

When logged in as a student the availability page shows available calls for all coaches and doesn't show the add availability link. Students are redirected away from the `new` and`destroy` actions. A student manually browsing to [/calls/new](http://127.0.0.1:3000/calls/new) will be redirected to the root route and attempting to enter a new call would raise an `ActiveRecord::AssociationTypeMismatch` error in any case. One significant issue that remains is that any user can create, update, or delete users if they know the url. Students are presented a "Book call" button on available calls which will add them to that call and a similar "Cancel Call" button to remove them, although there is currently nothing to notify the coach of either event.

To have coaches and students see different call lists (students see availability of all coaches, coaches only see their own) I made a subtype of a `Calls_Provider` for each, which I placed in the `/models` directory. The call providers and calls controller can list either available, scheduled, or past calls. I also used the [nilify_blanks](https://github.com/rubiety/nilify_blanks) gem to fix a bug where a student cancelling a call would reset th `call.student_id` to an empty string `""` rather thank `nil`.

Finally, as per the brief I didn't consider the UI design at all, or write any tests (I normally would, I promise!!)
