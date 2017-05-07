class GraduateSerializer < ActiveModel::Serializer

  attributes :id, :first_name, :last_name, :cohort,
       :bio, :website, :picture,
       :created_at, :updated_at
end
