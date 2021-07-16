## # App starts

    1. Initiate Authentication providers => Handle user authentication
    2. Post Authentication State => Initiate User provider => fetch user details / sign up new user
    3. Register device token (\*)
    4. Initiate rest of the other providers => Fetching their data

After above steps, we have current user data, activities and timeline and all other necessary data.

## # We are on home screens now. 🤩

---

    Logout => clear local storage and delete device token (\*), dispose all providers.

---

## # Providers Hierarchy (Higher the rank, broader the scope)

    1. Authentication Provider
    2. User Provider
    3. Other providers (Timeline, Activity etc.)
