class Reviewer
  include Neo4j::ActiveNode

  has_many :out, :rated, rel_class: Rating, unique: true

  property :name, index: :exact
end