class Reviewer
  include Neo4j::ActiveNode

  has_many :out, :rated, rel_class: Rating, model_class: Movie, unique: true

  property :name, index: :exact
end