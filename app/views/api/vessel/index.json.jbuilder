json.partial! 'api/components/status'
json.data do
  json.array! @vessel do |v|
    json.id v.id
    json.name v.name
    json.owner_id v.owner_id
    json.naccs_code v.naccs_code
    json.created_at v.created_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
