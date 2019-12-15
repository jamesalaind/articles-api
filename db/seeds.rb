# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(name: 'test', username: 'test', email: 'test@example.com', password: 'test123', password_confirmation: 'test123')
if user.save
  puts json: user, status: :created
else
  puts json: { errors: user.errors.full_messages },
         status: :unprocessable_entity
end

Article.create([
                   {
                       title: 'Test1',
                       user_id: User.first.id,
                       description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                   },
                   {
                       title: 'Test2',
                       user_id: User.first.id,
                       description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                   },
                   {
                       title: 'Test3',
                       user_id: User.first.id,
                       description: "Lorem ipsum keme keme keme 48 years keme majonders juts na jowa guash ano neuro doonek at sa ng ano bakit Gino sa quality control antibiotic sa mabaho at nang majubis ang majubis bonggakea sa nang dites borta effem shonget chaka pranella ano majubis borta Gino biway biway pamentos nakakalurky otoko bakit shonget ano guash urky bongga na bokot at nang emena gushung pamin keme keme thunder sa sa katagalugan emena gushung mahogany sudems katagalugan lulu ano shala doonek ang chipipay sa ano wiz at ang ano ng neuro juts mahogany effem urky antibiotic ma-kyonget na ang thunder chapter wasok shonga-shonga matod at nang kasi ganda lang."
                   },
               ])