ActiveAdmin.register Ability do
  permit_params %i[name description is_ultimate hero_id]
end
