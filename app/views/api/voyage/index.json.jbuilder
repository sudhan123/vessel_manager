json.partial! 'api/components/status'
json.data do
  json.array! @voyage do |v|
    json.id v.id
    json.from v.from
    json.to v.to
    json.vessel_id v.vessel_id
    json.date v.date.strftime('%Y-%m-%d')
    json.start_time v.start_time.strftime('%H:%M')
    json.end_time v.end_time.strftime('%H:%M')
  end
end
