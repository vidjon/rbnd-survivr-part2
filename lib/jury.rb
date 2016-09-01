class Jury
    attr_accessor :members
    def initialize
        @members = Array.new
    end

    def add_member(member)
        @members.push(member)
    end

    #returns hash of length 2
    def cast_votes(finalists)
        votes = {}
        finalists.each do |finalist|
            votes[finalist] = 0
        end
        @members.each do |jury_member|
            voted = finalists.sample
            votes[voted] += 1
            puts "#{jury_member} voted for #{voted}."
        end
        votes
    end

    def report_votes(votes)
        votes.each do |key, value|
            puts "#{key} received total #{value} votes"
        end
    end

    def announce_winner(votes)
        winner = votes.key(votes.values.max)
        puts "The winner of Survior is #{winner}!!".green
        winner
    end
end
