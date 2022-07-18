json.partial! 'api/components/status'
json.data do
    json.id @vessel.id
    json.name @vessel.name
    json.owner_id @vessel.owner_id
    json.naccs_code @vessel.naccs_code
    json.created_at @vessel.created_at.strftime('%Y-%m-%d %H:%M:%S')
end
