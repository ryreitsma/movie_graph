class Rating
  include Neo4j::ActiveRel

  from_class Reviewer
  to_class Movie
  type :rated
  creates_unique_rel

  property :score, type: Integer
end