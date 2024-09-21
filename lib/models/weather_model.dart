class WeatherModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    current = json['current'] != null
        ? Current.fromJson(json['current'])
        : null;
    forecast = json['forecast'] != null
        ? Forecast.fromJson(json['forecast'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (forecast != null) {
      data['forecast'] = forecast!.toJson();
    }
    return data;
  }
}

double? _toDouble(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  }
  return null;
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location(
      {this.name,
        this.region,
        this.country,
        this.lat,
        this.lon,
        this.tzId,
        this.localtimeEpoch,
        this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = _toDouble(json['lat']);
    lon = _toDouble(json['lon']);
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['region'] = region;
    data['country'] = country;
    data['lat'] = lat;
    data['lon'] = lon;
    data['tz_id'] = tzId;
    data['localtime_epoch'] = localtimeEpoch;
    data['localtime'] = localtime;
    return data;
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current(
      {this.lastUpdatedEpoch,
        this.lastUpdated,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.windchillC,
        this.windchillF,
        this.heatindexC,
        this.heatindexF,
        this.dewpointC,
        this.dewpointF,
        this.visKm,
        this.visMiles,
        this.uv,
        this.gustMph,
        this.gustKph});

  Current.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = (json['temp_c'] as num?)?.toDouble();
    tempF = (json['temp_f'] as num?)?.toDouble();
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = (json['wind_mph'] as num?)?.toDouble();
    windKph = (json['wind_kph'] as num?)?.toDouble();
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = (json['pressure_mb'] as num?)?.toDouble();
    pressureIn = (json['pressure_in'] as num?)?.toDouble();
    precipMm = (json['precip_mm'] as num?)?.toDouble();
    precipIn = (json['precip_in'] as num?)?.toDouble();
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = (json['feelslike_c'] as num?)?.toDouble();
    feelslikeF = (json['feelslike_f'] as num?)?.toDouble();
    windchillC = (json['windchill_c'] as num?)?.toDouble();
    windchillF = (json['windchill_f'] as num?)?.toDouble();
    heatindexC = (json['heatindex_c'] as num?)?.toDouble();
    heatindexF = (json['heatindex_f'] as num?)?.toDouble();
    dewpointC = (json['dewpoint_c'] as num?)?.toDouble();
    dewpointF = (json['dewpoint_f'] as num?)?.toDouble();
    visKm = (json['vis_km'] as num?)?.toDouble();
    visMiles = (json['vis_miles'] as num?)?.toDouble();
    uv = (json['uv'] as num?)?.toDouble();
    gustMph = (json['gust_mph'] as num?)?.toDouble();
    gustKph = (json['gust_kph'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_updated_epoch'] = lastUpdatedEpoch;
    data['last_updated'] = lastUpdated;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['uv'] = uv;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['icon'] = icon;
    data['code'] = code;
    return data;
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (forecastday != null) {
      data['forecastday'] =
          forecastday!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (hour != null) {
      data['hour'] = hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? avgvisKm;
  double? avgvisMiles;
  double? avghumidity;
  Condition? condition;
  double? uv;

  Day(
      {this.maxtempC,
        this.maxtempF,
        this.mintempC,
        this.mintempF,
        this.avgtempC,
        this.avgtempF,
        this.maxwindMph,
        this.maxwindKph,
        this.totalprecipMm,
        this.totalprecipIn,
        this.avgvisKm,
        this.avgvisMiles,
        this.avghumidity,
        this.condition,
        this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = _toDouble(json['maxtemp_c']);
    maxtempF = _toDouble(json['maxtemp_f']);
    mintempC = _toDouble(json['mintemp_c']);
    mintempF = _toDouble(json['mintemp_f']);
    avgtempC = _toDouble(json['avgtemp_c']);
    avgtempF = _toDouble(json['avgtemp_f']);
    maxwindMph = _toDouble(json['maxwind_mph']);
    maxwindKph = _toDouble(json['maxwind_kph']);
    totalprecipMm = _toDouble(json['totalprecip_mm']);
    totalprecipIn = _toDouble(json['totalprecip_in']);
    avgvisKm = _toDouble(json['avgvis_km']);
    avgvisMiles = _toDouble(json['avgvis_miles']);
    avghumidity = _toDouble(json['avghumidity']);
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    uv = _toDouble(json['uv']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maxtemp_c'] = maxtempC;
    data['maxtemp_f'] = maxtempF;
    data['mintemp_c'] = mintempC;
    data['mintemp_f'] = mintempF;
    data['avgtemp_c'] = avgtempC;
    data['avgtemp_f'] = avgtempF;
    data['maxwind_mph'] = maxwindMph;
    data['maxwind_kph'] = maxwindKph;
    data['totalprecip_mm'] = totalprecipMm;
    data['totalprecip_in'] = totalprecipIn;
    data['avgvis_km'] = avgvisKm;
    data['avgvis_miles'] = avgvisMiles;
    data['avghumidity'] = avghumidity;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['uv'] = uv;
    return data;
  }
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? willItRain;
  double? chanceOfRain;
  double? willItSnow;
  double? chanceOfSnow;
  double? visKm;
  double? visMiles;
  double? gustMph;
  double? gustKph;
  double? uv;

  Hour(
      {this.timeEpoch,
        this.time,
        this.tempC,
        this.tempF,
        this.isDay,
        this.condition,
        this.windMph,
        this.windKph,
        this.windDegree,
        this.windDir,
        this.pressureMb,
        this.pressureIn,
        this.precipMm,
        this.precipIn,
        this.humidity,
        this.cloud,
        this.feelslikeC,
        this.feelslikeF,
        this.windchillC,
        this.windchillF,
        this.heatindexC,
        this.heatindexF,
        this.dewpointC,
        this.dewpointF,
        this.willItRain,
        this.chanceOfRain,
        this.willItSnow,
        this.chanceOfSnow,
        this.visKm,
        this.visMiles,
        this.gustMph,
        this.gustKph,
        this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'];
    time = json['time'];
    tempC = (json['temp_c'] as num?)?.toDouble();
    tempF = (json['temp_f'] as num?)?.toDouble();
    isDay = json['is_day'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    windMph = (json['wind_mph'] as num?)?.toDouble();
    windKph = (json['wind_kph'] as num?)?.toDouble();
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = (json['pressure_mb'] as num?)?.toDouble();
    pressureIn = (json['pressure_in'] as num?)?.toDouble();
    precipMm = (json['precip_mm'] as num?)?.toDouble();
    precipIn = (json['precip_in'] as num?)?.toDouble();
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = (json['feelslike_c'] as num?)?.toDouble();
    feelslikeF = (json['feelslike_f'] as num?)?.toDouble();
    windchillC = (json['windchill_c'] as num?)?.toDouble();
    windchillF = (json['windchill_f'] as num?)?.toDouble();
    heatindexC = (json['heatindex_c'] as num?)?.toDouble();
    heatindexF = (json['heatindex_f'] as num?)?.toDouble();
    dewpointC = (json['dewpoint_c'] as num?)?.toDouble();
    dewpointF = (json['dewpoint_f'] as num?)?.toDouble();
    willItRain = (json['will_it_rain'] as num?)?.toDouble();
    chanceOfRain = (json['chance_of_rain'] as num?)?.toDouble();
    willItSnow = (json['will_it_snow'] as num?)?.toDouble();
    chanceOfSnow = (json['chance_of_snow'] as num?)?.toDouble();
    visKm = (json['vis_km'] as num?)?.toDouble();
    visMiles = (json['vis_miles'] as num?)?.toDouble();
    gustMph = (json['gust_mph'] as num?)?.toDouble();
    gustKph = (json['gust_kph'] as num?)?.toDouble();
    uv = (json['uv'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time_epoch'] = timeEpoch;
    data['time'] = time;
    data['temp_c'] = tempC;
    data['temp_f'] = tempF;
    data['is_day'] = isDay;
    if (condition != null) {
      data['condition'] = condition!.toJson();
    }
    data['wind_mph'] = windMph;
    data['wind_kph'] = windKph;
    data['wind_degree'] = windDegree;
    data['wind_dir'] = windDir;
    data['pressure_mb'] = pressureMb;
    data['pressure_in'] = pressureIn;
    data['precip_mm'] = precipMm;
    data['precip_in'] = precipIn;
    data['humidity'] = humidity;
    data['cloud'] = cloud;
    data['feelslike_c'] = feelslikeC;
    data['feelslike_f'] = feelslikeF;
    data['windchill_c'] = windchillC;
    data['windchill_f'] = windchillF;
    data['heatindex_c'] = heatindexC;
    data['heatindex_f'] = heatindexF;
    data['dewpoint_c'] = dewpointC;
    data['dewpoint_f'] = dewpointF;
    data['will_it_rain'] = willItRain;
    data['chance_of_rain'] = chanceOfRain;
    data['will_it_snow'] = willItSnow;
    data['chance_of_snow'] = chanceOfSnow;
    data['vis_km'] = visKm;
    data['vis_miles'] = visMiles;
    data['gust_mph'] = gustMph;
    data['gust_kph'] = gustKph;
    data['uv'] = uv;
    return data;
  }
}
