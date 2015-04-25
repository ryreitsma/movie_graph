class Actor
  include Neo4j::ActiveNode

  has_many :out, :acted_in, model_class: Movie, unique: true

  property :name, unique: true, index: :exact
end