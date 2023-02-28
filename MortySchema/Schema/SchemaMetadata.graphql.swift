// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol MortySchema_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == MortySchema.SchemaMetadata {}

public protocol MortySchema_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == MortySchema.SchemaMetadata {}

public protocol MortySchema_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == MortySchema.SchemaMetadata {}

public protocol MortySchema_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == MortySchema.SchemaMetadata {}

public extension MortySchema {
  typealias ID = String

  typealias SelectionSet = MortySchema_SelectionSet

  typealias InlineFragment = MortySchema_InlineFragment

  typealias MutableSelectionSet = MortySchema_MutableSelectionSet

  typealias MutableInlineFragment = MortySchema_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    public static func objectType(forTypename typename: String) -> Object? {
      switch typename {
      case "Query": return MortySchema.Objects.Query
      case "Characters": return MortySchema.Objects.Characters
      case "Character": return MortySchema.Objects.Character
      case "Location": return MortySchema.Objects.Location
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}