class Tribe
    attr_accessor :name, :members
    def initialize(options={})
     @name = options[:name]
     @members = options[:members]
     @color = options[:color]
     puts "Creating Tribe #{self.to_s}"
    end

    def to_s
        @color ? @name.send(@color) : @name
    end

    def tribal_council(options={})
        voteable_members = options[:immune] ? @members.select{ |member| member != options[:immune] } : @members
        member_voted_off = voteable_members.sample
        @members.delete(member_voted_off)
        member_voted_off
    end
end
