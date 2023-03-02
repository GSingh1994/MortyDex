// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension MortySchema {
  class AllLocationsQuery: GraphQLQuery {
    public static let operationName: String = "AllLocations"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query AllLocations($page: Int) {
          locations(page: $page) {
            __typename
            results {
              __typename
              id
              name
              type
              dimension
            }
          }
        }
        """#
      ))

    public var page: GraphQLNullable<Int>

    public init(page: GraphQLNullable<Int>) {
      self.page = page
    }

    public var __variables: Variables? { ["page": page] }

    public struct Data: MortySchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("locations", Locations?.self, arguments: ["page": .variable("page")]),
      ] }

      /// Get the list of all locations
      public var locations: Locations? { __data["locations"] }

      /// Locations
      ///
      /// Parent Type: `Locations`
      public struct Locations: MortySchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Locations }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result?]?.self),
        ] }

        public var results: [Result?]? { __data["results"] }

        /// Locations.Result
        ///
        /// Parent Type: `Location`
        public struct Result: MortySchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Location }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", MortySchema.ID?.self),
            .field("name", String?.self),
            .field("type", String?.self),
            .field("dimension", String?.self),
          ] }

          /// The id of the location.
          public var id: MortySchema.ID? { __data["id"] }
          /// The name of the location.
          public var name: String? { __data["name"] }
          /// The type of the location.
          public var type: String? { __data["type"] }
          /// The dimension in which the location is located.
          public var dimension: String? { __data["dimension"] }
        }
      }
    }
  }

}