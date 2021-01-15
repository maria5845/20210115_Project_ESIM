/**
 * ClArray 함수 목록
 */
/**
 * array 에서 특정 값 Group by 함수
 * ClArray.groupBy(items, properties, collect)
 * 
 * // 
 * ClArray._groupBy(items, properties)
 * 
 * // 
 * ClArray.groupByCategory(arr, prop)
 * 
 * // 
 * ClArray.groupByRange(arr, lookup)
 * 
 * // 
 * ClArray.collectProperties(groups, properties)
 * 
 * // 
 * ClArray.locationOf(element, array, start, end)
 * 
 * 
 * 
 */

/**
 * Class 선언
 */
if(parent.ClArray != null){
	ClArray = parent.ClArray;
} else{
	ClArray = {


			groupBy: function(items, properties, collect) {
				// TODO argument validation
				if (arguments.length < 2) return arr;
				var groups = ClArray._groupBy(items, properties);
				// collect other properties values in array
				if (collect && collect.length > 0)
					groups = ClArray.collectProperties(groups, collect);

				return groups;
			},

			_groupBy: function(items, properties) {
				var group = {};
				if (typeof properties[0] === 'string') {
					group = ClArray.groupByCategory(items, properties[0]);
				} else {
					group = ClArray.groupByRange(items, properties[0]);
				}
				properties = properties.slice(1);
				if (properties.length > 0) {
					for (var key in group) {
						group[key] = ClArray._groupBy(group[key], properties);
					}
				}
				return group;
			},

			groupByCategory: function(arr, prop) {
				return arr.reduce(function(group, item) {
					var tags = ClArray.propertyAt(item, prop);
					tags.forEach(function(tag) { 
						group[tag] = group[tag] || [];
						group[tag].push(item);
					});
					return group;
				},{});
			},

			groupByRange: function(arr, lookup) {
				return arr.reduce(function(group, f) {
					var val, ind, tag;
					val = ClArray.propertyAt(f, lookup.property);
					ind = locationOf(val, lookup.intervals);
					if (ind === lookup.intervals.length -1) ind--;
					tag = lookup.labels ? lookup.labels[ind] : ind;
					group[tag] = group[tag] || [];
					group[tag].push(f);
					return group;
				},{});
			},

			// collect the properties in an array 
			collectProperties: function(groups, properties) { 
				var collection = {};
				for (var key in groups) {
					if (Array.isArray(groups[key])) {
						collection[key] = groups[key].reduce(function(coll, item) {
							properties.forEach(function(prop) { 
								if (!coll[prop]) coll[prop] = [];
								coll[prop] = coll[prop].concat(ClArray.propertyAt(item,prop));
							})
							return coll;
						}, {})
					} else {
						collection[key] = ClArray.collectProperties(groups[key], properties);
					}
				}
				return collection;
			},

			locationOf: function(element, array, start, end){
				start = start || 0;
				end = end || array.length;
				var pivot = parseInt(start + (end - start) / 2, 10);
				if (end-start <= 1 || array[pivot] === element) return pivot;
				if (array[pivot] < element) {
					return ClArray.locationOf(element, array, pivot, end);
				} else {
					return ClArray.locationOf(element, array, start, pivot);
				}
			},

			propertyAt: function(obj, path) {
				var parts = path.split('.')
				var prop = parts.shift()
				if (ClArray.isPrimitive(obj[prop])) {
					return [obj[prop]]
				} else if (ClArray.isObject(obj[prop])) {
					return ClArray.propertyAt(obj[prop], parts.join('.'))
				} else if (ClArray.isPrimitiveArray(obj[prop])) {
					return obj[prop].reduce(function(values, val) {
						if (values.indexOf(val) < 0) values.push(val)
						return values
					},[])
				} else if (ClArray.isObjectArray(obj[prop])) {
					return obj[prop].reduce(function(values, item) {
						var vals = ClArray.propertyAt(item, parts.join('.'))
						vals.reduce(function(sum, key) {
							if (sum.indexOf(key) < 0) sum.push(key)
							return sum
						}, values)
						return values
					}, [])
				} else {
					throw new TypeError('property path: "'+ path + '" not valid in your data at object: '+ JSON.stringify(obj))
				}
			},

			isPrimitive: function(val) {
				return typeof val === 'string' || typeof val === 'number' 
					|| typeof val === 'boolean' 
			},

			isPrimitiveArray: function(val) {
				return Array.isArray(val) && val.length > 0 && ClArray.isPrimitive(val[0])
			}, 

			isObject: function(val) {
				// `typeof [{id: 1}]` returns value object so frst negate array 
				return !Array.isArray(val) && typeof val === 'object'
			},

			isObjectArray: function(val) {
				return Array.isArray(val) && val.length > 0 && typeof val[0] === 'object' 
			}

	}
}
