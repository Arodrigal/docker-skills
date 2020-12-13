from datetime import date, datetime

import isodate as iso
from bson import ObjectId
from flask.json import JSONEncoder
from werkzeug.routing import BaseConverter


class MongoJSONEncoder(JSONEncoder):
    def default(self, o):
        if isinstance(o, (datetime, date)):
            return iso.datetime_isoformat(o)
        if isinstance(o, ObjectId):
            return str(o)
        else:
            return super().default(o)


class ObjectIdConverter(BaseConverter):
    def to_python(self, value):
        return ObjectId(value)

    def to_url(self, value):
        return str(value)

def find_restaurants(mongo, _id=None):
    query = {}
    restaurant = None
    if _id:
        query["_id"] = ObjectId(_id)
        restaurantList = list(mongo.db.restaurant.find(query))
        if(len(restaurantList) == 0):
            raise KeyError("Not found restaurant with id: {}".format(_id))
        else:
            return restaurantList[0]
    else:
        return list(mongo.db.restaurant.find(query))
