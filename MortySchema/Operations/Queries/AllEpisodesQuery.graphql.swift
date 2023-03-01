// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension MortySchema {
  class AllEpisodesQuery: GraphQLQuery {
    public static let operationName: String = "AllEpisodes"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query AllEpisodes($page: Int) {
          episodes(page: $page) {
            __typename
            results {
              __typename
              episode
              name
              air_date
              characters {
                __typename
                id
                image
                name
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
        .field("episodes", Episodes?.self, arguments: ["page": .variable("page")]),
      ] }

      /// Get the list of all episodes
      public var episodes: Episodes? { __data["episodes"] }

      /// Episodes
      ///
      /// Parent Type: `Episodes`
      public struct Episodes: MortySchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Episodes }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("results", [Result?]?.self),
        ] }

        public var results: [Result?]? { __data["results"] }

        /// Episodes.Result
        ///
        /// Parent Type: `Episode`
        public struct Result: MortySchema.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Episode }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("episode", String?.self),
            .field("name", String?.self),
            .field("air_date", String?.self),
            .field("characters", [Character?].self),
          ] }

          /// The code of the episode.
          public var episode: String? { __data["episode"] }
          /// The name of the episode.
          public var name: String? { __data["name"] }
          /// The air date of the episode.
          public var air_date: String? { __data["air_date"] }
          /// List of characters who have been seen in the episode.
          public var characters: [Character?] { __data["characters"] }

          /// Episodes.Result.Character
          ///
          /// Parent Type: `Character`
          public struct Character: MortySchema.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Character }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("id", MortySchema.ID?.self),
              .field("image", String?.self),
              .field("name", String?.self),
            ] }

            /// The id of the character.
            public var id: MortySchema.ID? { __data["id"] }
            /// Link to the character's image.
            /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
            public var image: String? { __data["image"] }
            /// The name of the character.
            public var name: String? { __data["name"] }
          }
        }
      }
    }
  }

}