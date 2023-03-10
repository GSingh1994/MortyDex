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
              id
              episode
              name
              air_date
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