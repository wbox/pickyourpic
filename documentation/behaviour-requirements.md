# Behaviour Requirements

## Images

### GET /api/images

- If user is not looged in, return public images
- If user is logged in return public and private images
- Default filter is most recent images

Response:

[
  {
    "id: 1,
    "name": "Picture name",
    "description": "Description",
    "url": "http://....",
    "tags": [ "tag1", "tag2", "tag3" ],
    "publish_date": date,
    "location_info": "location info"
    "likes": 10,
    "dislikes": 1,
  }
]

## Users

## Collections



GET 

/api/images/
/api/images/search/tag

/api/images/users
/api/images/users/:id

/api/images/collections

/api/collections


## /api/users
# GET

- /api/users (/users)

List all users

- /api/users/:id

List user information with id = :id

# POST

-/api/users/new

Creates a new user on the database
Information required:
  - First Name
  - Last Name
  - Password
  - Avatar (not required, there will a default avatar image)



## /api/images
# GET

- /api/images

List all images

- /api/images/:id

Get image with id = :id


## /api/collections
# GET

- /api/collections

List all collections

- /api/collections/:id

List all pictures from where collection id = :id

# POST

- /api/collections/new

Create a new collection
User id is required

- /api/collections/:id/image/new

Add a new image to collections












