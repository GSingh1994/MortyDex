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