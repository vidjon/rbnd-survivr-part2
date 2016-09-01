require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require 'colorizr'

#After your tests pass, uncomment this code below
#=========================================================
 # Create an array of twenty hopefuls to compete on the island of Borneo
 @contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
 @contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

 # Create two new tribes with names
 @coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10), color: "yellow")
 @hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10), color: "green")

 # Create a new game of Survivor
 @borneo = Game.new(@coyopa, @hunapu)
#=========================================================


#This is where you will write your code for the three phases
def phase_one
    for i in 1..8
        tribe_lost_in_challenge = @borneo.immunity_challenge
        puts "Tribe #{tribe_lost_in_challenge.to_s} lost the immunity challenge and will go voting"
        member_voted_off = tribe_lost_in_challenge.tribal_council
        puts "#{"Member ".red + member_voted_off.name.red + "was voted off".red}  the island on tribal council from Tribe #{tribe_lost_in_challenge.to_s}"
    end
    puts "Merging together the two Tribes"
    8
end

def phase_two
    for i in 1..3
        immune_member = @borneo.individual_immunity_challenge
        puts "#{"Member ".green + immune_member.name.green + " won".green} the immunity challenge"
        member_voted_off = @borneo.tribes.last.tribal_council(immune: immune_member)
        puts "#{"Member ".red + member_voted_off.name.red + "was voted off.red"} the island on tribal council from Tribe #{@borneo.tribes.last.name}"
    end
    puts "Members remaining are : #{@borneo.tribes.last.members.map{|member| member.name}}"
    3
end

def phase_three
    for i in 1..7
        immune_member = @borneo.individual_immunity_challenge
        puts "#{"Member ".green + immune_member.name.green + "won".green} the immunity challenge"
        member_voted_off = @borneo.tribes.last.tribal_council(immune: immune_member)
        puts "#{"Member ".red + member_voted_off.name.red + "was voted off".red} the island on tribal council from Tribe #{@borneo.tribes.last.to_s}"
        @jury.add_member(member_voted_off)
        puts "#{"Member ".blue + member_voted_off.name.blue + "joins".blue} the Jury"
    end
    puts "Off to Jury voting, the final two are ".yellow
    @borneo.tribes.last.members.each do |m| p m.name end
    7
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
 phase_one #8 eliminations
 @merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
 phase_two #3 more eliminations
 @jury = Jury.new
 phase_three #7 elminiations become jury members
 finalists = @merge_tribe.members #set finalists
 vote_results = @jury.cast_votes(finalists) #Jury members report votes
 @jury.report_votes(vote_results) #Jury announces their votes
 @jury.announce_winner(vote_results) #Jury announces final winner
