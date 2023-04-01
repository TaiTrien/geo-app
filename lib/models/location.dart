/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Location type in your schema. */
@immutable
class Location extends Model {
  static const classType = const _LocationModelType();
  final String id;
  final double? _lat;
  final double? _lng;
  final TemporalTimestamp? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LocationModelIdentifier get modelIdentifier {
      return LocationModelIdentifier(
        id: id
      );
  }
  
  double? get lat {
    return _lat;
  }
  
  double? get lng {
    return _lng;
  }
  
  TemporalTimestamp? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Location._internal({required this.id, lat, lng, createdAt, updatedAt}): _lat = lat, _lng = lng, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Location({String? id, double? lat, double? lng, TemporalTimestamp? createdAt}) {
    return Location._internal(
      id: id == null ? UUID.getUUID() : id,
      lat: lat,
      lng: lng,
      createdAt: createdAt);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Location &&
      id == other.id &&
      _lat == other._lat &&
      _lng == other._lng &&
      _createdAt == other._createdAt;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Location {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("lng=" + (_lng != null ? _lng!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.toString() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Location copyWith({double? lat, double? lng, TemporalTimestamp? createdAt}) {
    return Location._internal(
      id: id,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      createdAt: createdAt ?? this.createdAt);
  }
  
  Location.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _lat = (json['lat'] as num?)?.toDouble(),
      _lng = (json['lng'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalTimestamp.fromSeconds(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'lat': _lat, 'lng': _lng, 'createdAt': _createdAt?.toSeconds(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'lat': _lat, 'lng': _lng, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<LocationModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<LocationModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static final QueryField LNG = QueryField(fieldName: "lng");
  static final QueryField CREATEDAT = QueryField(fieldName: "createdAt");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Location";
    modelSchemaDefinition.pluralName = "Locations";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Location.LAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Location.LNG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Location.CREATEDAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _LocationModelType extends ModelType<Location> {
  const _LocationModelType();
  
  @override
  Location fromJson(Map<String, dynamic> jsonData) {
    return Location.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Location';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Location] in your schema.
 */
@immutable
class LocationModelIdentifier implements ModelIdentifier<Location> {
  final String id;

  /** Create an instance of LocationModelIdentifier using [id] the primary key. */
  const LocationModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'LocationModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LocationModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}