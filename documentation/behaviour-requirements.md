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











