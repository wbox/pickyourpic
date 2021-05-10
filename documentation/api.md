

# /api/users
## GET

```GET /api/users (/users)```

List all users

```
SELECT * 
FROM users
```

Response

```
[
  {
    "id": 1,
    "first_name": "Name",
    "last_name: "Last",
    "nickname": "bla",
    "avatar": "http://"

  },
  {
    "id": 2,
    "first_name": "Name",
    "last_name": "Last",
    "nickname": "bla1",
    "avatar": "http://"
  }
]

```

```GET /api/users/:id```

List user information with id = :id

```
SELECT *
FROM users
WHERE user_id = :id
```
Response

```
[
  {
    "id": 1,
    "first_name": "Name",
    "last_name: "Last",
    "nickname": "bla",
    "avatar": "http://"

  }
]
```

## POST

```POST /api/users/new```

Creates a new user on the database

```
INSERT INTO users (first_name, last_name, nickname, password, avatar)
VALUES ($1, $2, $3, $4, $5)
```

Body:

```
{
  "first_name" : "first",
  "last_name": "last",
  "nickname": "nickname",
  "password": "password",
  "avatar": "http://"
}
```

```POST /api/users/:id/delete```

- Delete user with user id = :id
- Delete all user images and collections as well

Body:

```
{ "id": 1 }
```


# /api/images
## GET

```GET /api/images```

List all images (select from images table only)

Response:

```
[
  {
    "id": 1,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date"
  },
    {
    "id": 2,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date"
  }
]
```

```GET /api/images/:id```

Get image with id = :id

Join images, users, tags tables

Response:

```
[
  {
    "id": 2,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date",
    "nickname": "nickname",
    "tags": [ "bird", "wings", "nature" ]
  }
]
```

```GET /api/images/:user_id```

- List all images that belongs to user id = :user_id
- Join images, users, and tags

Response:

```
[
  {
    "id": 1,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date",
    "collection_id": collection_id,
    "collection_name": "bla1",
    "user_id": id,
    "nickname": "nickname",
    "tags": [ "birds", "wings", "nature" ]
  },
    {
    "id": 2,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date",
    "collection_id": collection_id,
    "collection_name": "bla",
    "user_id": id,
    "nickname": "nickname",
    "tags": [ "birds", "wings", "nature" ]
  }
]
```

```GET /api/images/search/:filter```

- List all images with name and tags = :filter
- Stretch features are to add specific searches based on the combination of:
  - name
  - tag
  - collection
  - user 

```
SELECT * FROM images
JOIN tags
WHERE image.name like '%filter%'
OR tag.name like '%filter%'
```

Response:

```
[
  {
    "id": 1,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date",
    "collection_id": collection_id,
    "collection_name": "bla1",
    "user_id": 1,
    "nickname": "nickname1",
    "tags": [ "birds", "wings", "nature" ]
  },
    {
    "id": 2,
    "name": "image name",
    "description": "image description",
    "url": "image url",
    "publish_date": "date",
    "collection_id": collection_id,
    "collection_name": "bla",
    "user_id": 2,
    "nickname": "nickname2",
    "tags": [ "birds", "wings", "nature" ]
  }
]
```
## POST

```POST /api/images/new```

- Add a new image (one image)

Body:
```
{
  "name": "image name",
  "description": "image description",
  "url": "image url",
  "publish_date": "date",
  "collection_id": collection_id,
  "user_id": 1,
  "tags": [ 2, 4, 5, 6 ]
}
```


# /api/collections
## GET

```GET /api/collections```

List all collections

Response:

```
[
  {
    "id": 1,
    "name": "Collection 1",
    "user_id": 1
  },
  {
    "id": 2,
    "name": "Collection 2",
    "user_id": 1
  },
  {
    "id": 3,
    "name": "Collection 3",
    "user_id": 2
  }
]
```

```GET /api/collections/:id```

Collection Details

Response:

```
[
  {
    "id": 1,
    "name": "Collection 1",
    "nickname": "Nickname",
    "images": [ 1, 5, 6, 7]
  }
]
```

## POST

```POST /api/collections/new```

Create a new collection
User id is required

Body:

```
{ "name": "Collection name", "user_id": user_id }
```

```POST /api/collections/:id/image/new```

Add a new image to collection

Body:
```
{ "collection_id": 1, "image_id": [ 100 ] }
```


# /api/tags

## GET

```GET /api/tags```

- List all tags

```
SELECT *
FROM tags
```

```
[
  {
    "id": 1,
    "name": "birds"
  },
  {
    "id": 2,
    "name": "nature"
  },
  {
    "id": 3,
    "name": "planes"
  }    
]
```

## POST

```POST /api/tags/:name/new```

- Add a new image tag

```
INSERT INTO tags (name)
VALUES ($1)
```

Body:

```
{ "name": "birds" }
```


```POST /api/tags/:id/delete```

- Remove a tag

```
DELETE FROM tags
WHERE id = $1
```

Body:

```
{ "id": [ 1 ] }
```

```POST /api/tags/:id/update```

- Update a tag name based on the tag id

```
UPDATE tags
SET name=$2
WHERE id=$1
```

Body:

```
{ "id": 1, "name": "birds" }
```
