class Rating
  include Neo4j::ActiveRel

  from Reviewer
  to Movie
  type :rated

  property :score, index: :exact, type: Integer
end