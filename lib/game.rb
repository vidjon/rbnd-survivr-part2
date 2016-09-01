class Game
    attr_reader :tribes
    def initialize(tribe_1, tribe_2)
        @tribes = [tribe_1, tribe_2]
    end

    def add_tribe(tribe)
        @tribes.push(tribe)
    end

    def immunity_challenge
        @tribes.sample
    end

    def clear_tribes
        @tribes = []
    end

    def merge(name_of_merged_tribes)
        new_members = @tribes[0].members
        @tribes[1].members.each do |member|
            new_members.push(member)
        end
        add_tribe(Tribe.new(name: name_of_merged_tribes, members: new_members, color: "blue"))
        @tribes.last
    end

    def individual_immunity_challenge
        @tribes.last.members.sample
    end

end
