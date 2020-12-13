db = new Mongo().getDB("intel-db");

// create admin user

db.createUser({
    user: "mongo-intel",
    pwd: "f5adD95sBa",
    roles: [ 
        { role: "readWrite", db: "intel-db" },
        { role: "read", db:"another-database" }
    ]
});