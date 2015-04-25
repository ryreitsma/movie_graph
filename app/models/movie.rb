class Movie
  include Neo4j::ActiveNode

  has_many :in, :actors, model_class: Actor, origin: :acted_in

  property :title, unique: :true, index: :exact
end