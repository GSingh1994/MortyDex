// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public extension MortySchema {
  class EpisodeQuery: GraphQLQuery {
    public static let operationName: String = "Episode"
    public static let document: ApolloAPI.DocumentType = .notPersisted(
      definition: .init(
        #"""
        query Episode($episodeId: ID!) {
          episode(id: $episodeId) {
            __typename
            id
            name
            episode
            air_date
            characters {
              __typename
              id
              name
              image
            }
          }
        }
        """#
      ))

    public var episodeId: ID

    public init(episodeId: ID) {
      self.episodeId = episodeId
    }

    public var __variables: Variables? { ["episodeId": episodeId] }

    public struct Data: MortySchema.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Query }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("episode", Episode?.self, arguments: ["id": .variable("episodeId")]),
      ] }

      /// Get a specific episode by ID
      public var episode: Episode? { __data["episode"] }

      /// Episode
      ///
      /// Parent Type: `Episode`
      public struct Episode: MortySchema.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ApolloAPI.ParentType { MortySchema.Objects.Episode }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("id", MortySchema.ID?.self),
          .field("name", String?.self),
          .field("episode", String?.self),
          .field("air_date", String?.self),
          .field("characters", [Character?].self),
        ] }

        /// The id of the episode.
        public var id: MortySchema.ID? { __data["id"] }
        /// The name of the episode.
        public var name: String? { __data["name"] }
        /// The code of the episode.
        public var episode: String? { __data["episode"] }
        /// The air date of the episode.
        public var air_date: String? { __data["air_date"] }
        /// List of characters who have been seen in the episode.
        public var characters: [Character?] { __data["characters"] }

        /// Episode.Character
        ///
        /// Parent Type: `Character`
        public struct Character: MortySchema.SelectionSet {
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