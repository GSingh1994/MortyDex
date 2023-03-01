// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension MortySchema {
  class AllCharactersQuery: GraphQLQuery {
    public static let operationName: String = "AllCharacters"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query AllCharacters($page: Int) {
          characters(page: $page) {
            __typename
            results {
              __typename
              id
              name
              image
              status
              species
              gender
              origin {
                __typename
                name
              }
              location {
                __typename
                name
              }
              episode {
                __typename
                id
                episode
                name
                air_date
              }
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
        .field("characters", Characters?.self, arguments: ["page": .variable("page")]),
      ] }

      /// Get the list of all characters
      public var characters: Characters? { __data["characters"] }

      /// Characters
      ///
      /// Parent Type: `Characters`
      public struct Characters: MortySchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Characters }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result?]?.self),
        ] }

        public var results: [Result?]? { __data["results"] }

        /// Characters.Result
        ///
        /// Parent Type: `Character`
        public struct Result: MortySchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Character }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("id", MortySchema.ID?.self),
            .field("name", String?.self),
            .field("image", String?.self),
            .field("status", String?.self),
            .field("species", String?.self),
            .field("gender", String?.self),
            .field("origin", Origin?.self),
            .field("location", Location?.self),
            .field("episode", [Episode?].self),
          ] }

          /// The id of the character.
          public var id: MortySchema.ID? { __data["id"] }
          /// The name of the character.
          public var name: String? { __data["name"] }
          /// Link to the character's image.
          /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
          public var image: String? { __data["image"] }
          /// The status of the character ('Alive', 'Dead' or 'unknown').
          public var status: String? { __data["status"] }
          /// The species of the character.
          public var species: String? { __data["species"] }
          /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
          public var gender: String? { __data["gender"] }
          /// The character's origin location
          public var origin: Origin? { __data["origin"] }
          /// The character's last known location
          public var location: Location? { __data["location"] }
          /// Episodes in which this character appeared.
          public var episode: [Episode?] { __data["episode"] }

          /// Characters.Result.Origin
          ///
          /// Parent Type: `Location`
          public struct Origin: MortySchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Location }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String?.self),
            ] }

            /// The name of the location.
            public var name: String? { __data["name"] }
          }

          /// Characters.Result.Location
          ///
          /// Parent Type: `Location`
          public struct Location: MortySchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Location }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("name", String?.self),
            ] }

            /// The name of the location.
            public var name: String? { __data["name"] }
          }

          /// Characters.Result.Episode
          ///
          /// Parent Type: `Episode`
          public struct Episode: MortySchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Episode }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("id", MortySchema.ID?.self),
              .field("episode", String?.self),
              .field("name", String?.self),
              .field("air_date", String?.self),
            ] }

            /// The id of the episode.
            public var id: MortySchema.ID? { __data["id"] }
            /// The code of the episode.
            public var episode: String? { __data["episode"] }
            /// The name of the episode.
            public var name: String? { __data["name"] }
            /// The air date of the episode.
            public var air_date: String? { __data["air_date"] }
          }
        }
      }
    }
  }

}