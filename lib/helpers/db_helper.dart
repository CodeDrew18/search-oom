import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String dbName = 'searchoommmmmmm.db';
  static const int dbVersion = 1;

  static const String buildingTb = "building";
  static const String buildingId = "building_id";
  static const String buildingName = "building_name";
  static const String buildingImage = "building_image";
  static const String buildingX = "building_x";
  static const String buildingY = "building_y";

  static const String floorTb = "floor";
  static const String floorId = "floor_id";
  static const String buildingIdFk = "building_id";
  static const String floorNumber = "floor_number";
  static const String floorPlan = "floor_plan";

  static const String roomTb = "room";
  static const String roomId = "room_id";
  static const String floorIdFk = "floor_id";
  static const String roomImage = "room_image";
  static const String roomNumber = "room_number";
  static const String roomCapacity = "room_capacity";
  static const String roomType = "room_type";
  static const String isUsable = "is_usable";
  static const String isAvailable = "is_available";

  static const String amenitiesTb = "amenities";
  static const String amenitiesId = "amenitiesId";
  static const String amenitiesName = "amenitiesName";

  static const String roomAmenitiesTb = "room_amenities";
  static const String roomAmenitiesId = "room_amenities_id";
  static const String amenitiesIdFk = "amenities_id";
  static const String roomIdFk = "room_id";
  static const String amenityQuantity = "quantity";
  static const String amenitiesIsAvailable = "is_amenities_available";

  static const String userTb = "user";
  static const String userId = "user_id";
  static const String userEmail = "user_email";
  static const String userPassword = "user_password";
  static const String userPicture = "user_picture";

  static Future<Database> openDb() async {
    var path = join(await getDatabasesPath(), dbName);

    var db = await openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE IF NOT EXISTS $buildingTb (
            $buildingId INTEGER PRIMARY KEY,
            $buildingName TEXT NOT NULL,
            $buildingImage TEXT,
            $buildingX INTEGER,
            $buildingY INTEGER
          )
        ''');
        db.execute('''
          CREATE TABLE IF NOT EXISTS $floorTb (
            $floorId INTEGER PRIMARY KEY,
            $buildingIdFk INTEGER NOT NULL,
            $floorNumber INTEGER NOT NULL,
            $floorPlan TEXT,
            FOREIGN KEY ($buildingIdFk) REFERENCES $buildingTb ($buildingId)
          )
        ''');
        db.execute('''
          CREATE TABLE IF NOT EXISTS $roomTb (
            $roomId INTEGER PRIMARY KEY,
            $floorIdFk INTEGER NOT NULL,
            $roomImage TEXT,
            $roomNumber TEXT NOT NULL,
            $roomCapacity INTEGER,
            $roomType TEXT NOT NULL,
            $isUsable INTEGER NOT NULL,
            $isAvailable INTEGER NOT NULL,
            FOREIGN KEY ($floorIdFk) REFERENCES $floorTb ($floorId)
          )
        ''');
        db.execute('''
          CREATE TABLE IF NOT EXISTS $amenitiesTb (
            $amenitiesId INTEGER PRIMARY KEY,
            $amenitiesName TEXT NOT NULL
          )
        ''');
        db.execute('''
          CREATE TABLE IF NOT EXISTS $roomAmenitiesTb (
            $roomAmenitiesId INTEGER PRIMARY KEY AUTOINCREMENT,
            $amenitiesIdFk INTEGER NOT NULL,
            $roomIdFk INTEGER NOT NULL,
            $amenityQuantity INTEGER NOT NULL,
            $amenitiesIsAvailable INTEGER NOT NULL,
            FOREIGN KEY ($amenitiesIdFk) REFERENCES $amenitiesTb ($amenitiesId),
            FOREIGN KEY ($roomIdFk) REFERENCES $roomTb ($roomId)
          )
        ''');

        db.execute('''
          CREATE TABLE IF NOT EXISTS $userTb (
            $userId INTEGER PRIMARY KEY AUTOINCREMENT,
            $userEmail VARCHAR(255) NOT NULL,
            $userPassword VARCHAR(255) NOT NULL,
            $userPicture TEXT NOT NULL
          )
        ''');

        db.insert(
          buildingTb,
          {
            buildingId: 1,
            buildingName: 'Academic Building 1',
            buildingImage: "assets/images/rooms/academic_building_1.png",
            buildingX: 62,
            buildingY: 108,
          },
        );
        db.insert(
          floorTb,
          {
            floorId: 1,
            buildingIdFk: 1,
            floorNumber: 0,
            floorPlan: null,
          },
        );
        db.insert(
          floorTb,
          {
            floorId: 2,
            buildingIdFk: 1,
            floorNumber: 2,
            floorPlan: null,
          },
        );
        db.insert(
          floorTb,
          {
            floorId: 3,
            buildingIdFk: 1,
            floorNumber: 3,
            floorPlan: null,
          },
        );

        List<Map<String, dynamic>> rooms = [
          {
            roomId: 1,
            floorIdFk: 1,
            roomImage: null,
            roomNumber: 'Park Room',
            roomCapacity: 55,
            roomType: 'open area',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 2,
            floorIdFk: 2,
            roomImage: "assets/images/rooms/AB1_202.png",
            roomNumber: 'AB1 - 202',
            roomCapacity: 46,
            roomType: 'laboratory',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 3,
            floorIdFk: 2,
            roomImage: "assets/images/rooms/AB1_203.png",
            roomNumber: 'AB1 - 203',
            roomCapacity: 46,
            roomType: 'laboratory',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 4,
            floorIdFk: 2,
            roomImage: "assets/images/rooms/AB1_204.png",
            roomNumber: 'AB1 - 204',
            roomCapacity: 46,
            roomType: 'laboratory',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 5,
            floorIdFk: 2,
            roomImage: "assets/images/rooms/AB1_205.png",
            roomNumber: 'AB1 - 205',
            roomCapacity: 55,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 6,
            floorIdFk: 2,
            roomImage: "assets/images/rooms/AB1_206.png",
            roomNumber: 'AB1 - 206',
            roomCapacity: 55,
            roomType: 'laboratory',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 7,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 302',
            roomCapacity: null,
            roomType: 'laboratory',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 8,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 303',
            roomCapacity: null,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 9,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 304',
            roomCapacity: null,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 10,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 305',
            roomCapacity: null,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 11,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 306',
            roomCapacity: null,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          },
          {
            roomId: 12,
            floorIdFk: 3,
            roomImage: null,
            roomNumber: 'AB1 - 307',
            roomCapacity: null,
            roomType: 'lecture',
            isUsable: 1,
            isAvailable: 1
          }
        ];

        for (var room in rooms) {
          db.insert(roomTb, room);
        }

        List<Map<String, dynamic>> amenities = [
          {amenitiesId: 1, amenitiesName: 'Aircon'},
          {amenitiesId: 2, amenitiesName: 'Smart TV'},
          {amenitiesId: 3, amenitiesName: 'Electric Fan'},
          {amenitiesId: 4, amenitiesName: 'Projector'},
          {amenitiesId: 5, amenitiesName: 'Chairs'},
          {amenitiesId: 6, amenitiesName: 'Tables'},
          {amenitiesId: 7, amenitiesName: 'Board'},
          {amenitiesId: 8, amenitiesName: 'PCs'},
          {amenitiesId: 9, amenitiesName: 'Apple Mac Pro'}
        ];

        for (var amenity in amenities) {
          db.insert(amenitiesTb, amenity);
        }

        List<Map<String, dynamic>> roomAmenities = [
          // Room 202
          {
            amenitiesIdFk: 1,
            roomIdFk: 2,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 2,
            roomIdFk: 2,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 5,
            roomIdFk: 2,
            amenityQuantity: 46,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 8,
            roomIdFk: 2,
            amenityQuantity: 35,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 7,
            roomIdFk: 2,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },

          // Room 203
          {
            amenitiesIdFk: 1,
            roomIdFk: 3,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 2,
            roomIdFk: 3,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 5,
            roomIdFk: 3,
            amenityQuantity: 46,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 9,
            roomIdFk: 3,
            amenityQuantity: 35,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 7,
            roomIdFk: 3,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },

          // Room 204
          {
            amenitiesIdFk: 1,
            roomIdFk: 4,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 2,
            roomIdFk: 4,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 5,
            roomIdFk: 4,
            amenityQuantity: 46,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 8,
            roomIdFk: 4,
            amenityQuantity: 35,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 7,
            roomIdFk: 4,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },

          // Room 205
          {
            amenitiesIdFk: 1,
            roomIdFk: 5,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 2,
            roomIdFk: 5,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 5,
            roomIdFk: 5,
            amenityQuantity: 55,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 3,
            roomIdFk: 5,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 7,
            roomIdFk: 5,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },

          // Room 206
          {
            amenitiesIdFk: 1,
            roomIdFk: 6,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 2,
            roomIdFk: 6,
            amenityQuantity: 1,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 5,
            roomIdFk: 6,
            amenityQuantity: 55,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 8,
            roomIdFk: 6,
            amenityQuantity: 30,
            amenitiesIsAvailable: 1
          },
          {
            amenitiesIdFk: 7,
            roomIdFk: 6,
            amenityQuantity: 2,
            amenitiesIsAvailable: 1
          }
        ];

        for (var roomAmenity in roomAmenities) {
          db.insert(roomAmenitiesTb, roomAmenity);
        }
      },
    );

    return db;
  }

  static Future<List<Map<String, dynamic>>> fetchBuildings() async {
    var db = await DbHelper.openDb();
    return db.rawQuery("SELECT * FROM $buildingTb");
  }

  static Future<List<Map<String, dynamic>>> fetchFloors(int buildingId) async {
    var db = await DbHelper.openDb();
    return db
        .rawQuery("SELECT * FROM $floorTb WHERE $buildingIdFk = ${buildingId}");
  }

  static Future<List<Map<String, dynamic>>> fetchRooms(int floorId) async {
    var db = await DbHelper.openDb();

    return db.rawQuery("SELECT * FROM $roomTb WHERE $floorIdFk = ${floorId}");
  }

  static Future<List<Map<String, dynamic>>> fetchAmenities(int roomId) async {
    var db = await DbHelper.openDb();

    return db.rawQuery(
        "SELECT $amenitiesName, $amenityQuantity FROM $roomAmenitiesTb INNER JOIN $amenitiesTb ON $roomAmenitiesTb.$amenitiesIdFk = $amenitiesTb.$amenitiesId WHERE $roomIdFk = ${roomId}");
  }

  static Future<List<Map<String, dynamic>>> searchBuilding(
      String searchKey) async {
    var db = await DbHelper.openDb();

    return db.rawQuery('''
    SELECT DISTINCT 
        $buildingTb.$buildingId, 
        $buildingTb.$buildingName, 
        $buildingTb.$buildingImage
    FROM $buildingTb
    LEFT JOIN $floorTb ON $buildingTb.$buildingId = $floorTb.$buildingIdFk
    LEFT JOIN $roomTb ON $floorTb.$floorId = $roomTb.$floorIdFk
    WHERE $buildingTb.$buildingName LIKE '%$searchKey%' 
      OR $roomTb.$roomNumber LIKE '%$searchKey%'
  ''');
  }

  static Future<List<Map<String, dynamic>>> fetchFloorsAndRooms(
    int buildingId, {
    String searchFloorNumber = "",
    Map<String, dynamic>? filters,
  }) async {
    var db = await DbHelper.openDb();

    String query = '''
    SELECT DISTINCT
        $floorTb.$floorId,
        $floorTb.$floorNumber,
        $roomTb.$roomId,
        $roomTb.$roomNumber,
        $roomTb.$roomImage,
        $roomTb.$roomCapacity,
        $roomTb.$roomType,
        $roomTb.$isUsable,
        $roomTb.$isAvailable
    FROM 
        $floorTb
    LEFT JOIN 
        $roomTb
    ON 
        $floorTb.$floorId = $roomTb.$floorIdFk
    LEFT JOIN 
        $roomAmenitiesTb 
    ON 
        $roomTb.$roomId = $roomAmenitiesTb.$roomIdFk
    LEFT JOIN 
        $amenitiesTb 
    ON 
        $roomAmenitiesTb.$amenitiesIdFk = $amenitiesTb.$amenitiesId
    WHERE 
        $floorTb.$buildingIdFk = $buildingId
    ''';

    if (searchFloorNumber.isNotEmpty) {
      query += '''
      AND 
        $roomTb.$roomNumber LIKE '%$searchFloorNumber%'
      ''';
    }

    List availabilityFilter = [];
    List amenitiesFilter = [];
    List roomTypeFilter = [];
    List locationFilter = [];
    List capacityFilter = [];

    if (filters != null) {
      if (filters['isAvailable'] == true) {
        availabilityFilter.add("$roomTb.$isAvailable = 1");
      }
      if (filters['isOccupied'] == true) {
        availabilityFilter.add("$roomTb.$isAvailable = 0");
      }
      if (filters['hasProjector'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Projector'");
      }
      if (filters['hasSmartTv'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Smart TV'");
      }
      if (filters['hasElectricFan'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Electric Fan'");
      }
      if (filters['hasAircon'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Aircon'");
      }
      if (filters['hasChair'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Chairs'");
      }
      if (filters['hasTable'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Tables'");
      }
      if (filters['hasBoard'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Board'");
      }
      if (filters['hasPc'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'PCs'");
      }
      if (filters['hasAppleMacPro'] == true) {
        amenitiesFilter.add("$amenitiesTb.$amenitiesName = 'Apple Mac Pro'");
      }
      if (filters['isOpenArea'] == true) {
        roomTypeFilter.add("$roomTb.$roomType = 'open area'");
      }
      if (filters['isLaboratory'] == true) {
        roomTypeFilter.add("$roomTb.$roomType = 'laboratory'");
      }
      if (filters['isLecture'] == true) {
        roomTypeFilter.add("$roomTb.$roomType = 'lecture'");
      }
      if (filters['isGroundFloor'] == true) {
        locationFilter.add("$floorTb.$floorNumber = 0");
      }
      if (filters['isFirstFloor'] == true) {
        locationFilter.add("$floorTb.$floorNumber = 1");
      }
      if (filters['isSecondFloor'] == true) {
        locationFilter.add("$floorTb.$floorNumber = 2");
      }
      if (filters['isThirdFloor'] == true) {
        locationFilter.add("$floorTb.$floorNumber = 3");
      }
      if (filters['isFourthFloor'] == true) {
        locationFilter.add("$floorTb.$floorNumber = 4");
      }
      if (filters['isSmallRoom'] == true) {
        capacityFilter.add("$roomTb.$roomCapacity BETWEEN 1 AND 39");
      }
      if (filters['isMediumRoom'] == true) {
        capacityFilter.add("$roomTb.$roomCapacity BETWEEN 40 AND 49");
      }
      if (filters['isLargeRoom'] == true) {
        capacityFilter.add("$roomTb.$roomCapacity >= 50");
      }
    }

    if (availabilityFilter.isNotEmpty) {
      query += 'AND (${availabilityFilter.join(" OR ")})';
    }
    if (amenitiesFilter.isNotEmpty) {
      query +=
          'AND (${amenitiesFilter.join(" OR ")}) AND $roomAmenitiesTb.$amenitiesIsAvailable = 1';
    }
    if (roomTypeFilter.isNotEmpty) {
      query += 'AND (${roomTypeFilter.join(" OR ")})';
    }
    if (locationFilter.isNotEmpty) {
      query += 'AND (${locationFilter.join(" OR ")})';
    }
    if (capacityFilter.isNotEmpty) {
      query += 'AND (${capacityFilter.join(" OR ")})';
    }

    query += '''
      ORDER BY 
        $floorTb.$floorNumber, $roomTb.$roomNumber
    ''';

    return db.rawQuery(query);
  }

  static void insertUser(String email, String password, String picture) {
    
  }
}
