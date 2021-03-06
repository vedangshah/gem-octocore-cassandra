require 'cequel'

require 'octocore-cassandra/counter'
require 'octocore-cassandra/trendable'
require 'octocore-cassandra/schedeuleable'

module Octo

  class TagHit
    include Cequel::Record
    extend Octo::Counter
    extend Octo::Trendable
    extend Octo::Scheduleable

    COUNTERS = 20

    belongs_to :enterprise, class_name: 'Octo::Enterprise'

    countables
    trendables

    baseline 'Octo::TagBaseline'
    trends_class 'Octo::TagTrend'

  end
end
