// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension MortySchema {
  class LocationQuery: GraphQLQuery {
    public static let operationName: String = "Location"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Location($locationId: ID!) {
          location(id: $locationId) {
            __typename
            id
            name
            type
            dimension
            residents {
              __typename
              id
              name
              image
            }
          }
        }
        """#
      ))

    public var locationId: ID

    public init(locationId: ID) {
      self.locationId = locationId
    }

    public var __variables: Variables? { ["locationId": locationId] }

    public struct Data: MortySchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("location", Location?.self, arguments: ["id": .variable("locationId")]),
      ] }

      /// Get a specific locations by ID
      public var location: Location? { __data["location"] }

      /// Location
      ///
      /// Parent Type: `Location`
      public struct Location: MortySchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Location }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", MortySchema.ID?.self),
          .field("name", String?.self),
          .field("type", String?.self),
          .field("dimension", String?.self),
          .field("residents", [Resident?].self),
        ] }

        /// The id of the location.
        public var id: MortySchema.ID? { __data["id"] }
        /// The name of the location.
        public var name: String? { __data["name"] }
        /// The type of the location.
        public var type: String? { __data["type"] }
        /// The dimension in which the location is located.
        public var dimension: String? { __data["dimension"] }
        /// List of characters who have been last seen in the location.
        public var residents: [Resident?] { __data["residents"] }

        /// Location.Resident
        ///
        /// Parent Type: `Character`
        public struct Resident: MortySchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Character }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", MortySchema.ID?.self),
            .field("name", String?.self),
            .field("image", String?.self),
          ] }

          /// The id of the character.
          public var id: MortySchema.ID? { __data["id"] }
          /// The name of the character.
          public var name: String? { __data["name"] }
          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? { __data["image"] }
        }
      }
    }
  }

}