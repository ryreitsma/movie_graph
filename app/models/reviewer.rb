class Reviewer
  include Neo4j::ActiveNode

  has_many :out, :rated, rel_class: Rating

  property :name, index: :exact
end